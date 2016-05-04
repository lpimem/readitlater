# == Schema Information
#
# Table name: links
#
#  id          :integer          not null, primary key
#  url         :string
#  title       :string
#  description :string
#  level       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  account_id  :integer
#

class LinksController < ApplicationController
  include LinksHelper
  before_action :authenticate_account!, only: [:filter_following, :edit, :update, :destroy]
  before_action :set_link, only: [:show, :edit, :update, :destroy]


  # GET /links
  # GET /links.json
  def index
     set_page
     if account_signed_in?
       pub_links = get_public_links
       pri_links = get_only_for_follower_links
       links_by_me = get_links_by_account current_account.id
       @links = (pub_links + pri_links + links_by_me).uniq{|link| link.id}
     else
       @links = get_public_links
     end
     sort_links
     update_page_states
  end

  # GET /links/1
  # GET /links/1.json
  def show
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1/edit
  def edit
    if not auth_check
      return
    end
    @link.tags_text = @link.tags.map{|t| t.label}.join(", ")
  end

  # POST /links
  # POST /links.json
  def create
    Link.transaction do
      @link = Link.new(link_params)
      @link.account_id = current_account.id
      if link_params.key?(:tags_text)
        tag_labels = link_params[:tags_text].split(/[,;.\s\r\n]+/)
        @link.tags = get_or_create_tags(tag_labels)
      end
      if @link.save
        redirect_to authenticated_root_path, notice: 'Link was successfully created.'
      else
        render :new
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    if not auth_check
      return
    end
    Link.transaction do
      if link_params.key?(:tags_text)
        tag_labels = link_params[:tags_text].split(/[,;.\s\r\n]+/)
        @link.tags = get_or_create_tags(tag_labels)
      end
      if @link.update(link_params)
        redirect_to @link, notice: 'Link was successfully updated.'
      else
        render :edit
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    if not auth_check
      return
    end
    if @link.destroy
      respond_to do |format|
        format.html { redirect_to authenticated_root_path, notice: 'Link was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  def search
    set_page
    kwd = params[:keyword]
    @keyword = kwd
    by_tag = Link.joins(
      'LEFT JOIN link_tag_rels as a on a.link_id = links.id
      LEFT JOIN tags as b on b.id = a.tag_id')
      .where("b.label like ?", '%' + kwd+'%').order("links.created_at DESC")
    by_title_desc = Link.where("title like ? or description like ?",
      "%" + kwd + "%",
      "%" + kwd + "%" ).order("links.created_at DESC")
    @links = (by_tag + by_title_desc).uniq{|x| x.id}
    update_page_states
  end

  def filter_following
    if current_account
      set_page
      @links = get_followed_links
      sort_links
      update_page_states
    else
      redirect_to unauthenticated_root_path, notice: 'You are not logged in.'
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      begin
        @link = Link.find(params[:id])
      rescue => ex
        redirect_to authenticated_root_path, :alert => ex.message
      end
    end

    # query links shared with public
    def get_public_links
      Link.where("level = 1")
    end

    # query links shared with current account
    def get_followed_links
      Link.joins(
        'LEFT JOIN accounts as a on a.id = links.account_id
        LEFT JOIN followships as f on a.id = f.following_id')
        .where("f.follower_id = ?", current_account.id)
    end

    def get_only_for_follower_links
      Link.joins(
        'LEFT JOIN accounts as a on a.id = links.account_id
        LEFT JOIN followships as f on a.id = f.following_id')
        .where("links.level=2 and f.follower_id = ?", current_account.id)
    end

    def get_links_by_account(account_id)
      Link.where("account_id = ?", account_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:url, :title, :description, :level, :tags_text)
    end

    def query_tags(tag_labels)
      Tag.where(label: tag_labels)
    end

    def get_or_create_tags(tag_labels)
      tags = query_tags(tag_labels)
      to_create = tag_labels - tags.map { |tag| tag.label }
      if to_create.any?
        Tag.transaction do
          to_create.each do |label|
            tags << Tag.create!(label: label)
          end
        end
      end
      tags
    end

    def auth_check
      if current_account
        if @link
          if current_account.id == @link.user.id or current_account.level == 1
            return true
          end
        end
      end
      redirect_to authenticated_root_path, :alert => 'You are not authorized to do so...'
      return false
    end
end
