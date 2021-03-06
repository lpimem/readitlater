# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  reason     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  link_id    :integer
#  account_id :integer
#

class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    reports = Report.all
    valid = []
    reports.each {|r|
      if Link.exists?(r.link_id)
        valid << r
      else
        r.destroy
      end
    }
    @reports = valid
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
    if Link.exists?(params[:id])
      @link = Link.find(params[:id])
    else
      redirect_to :back, notice: 'Link not found.'
    end
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Link was reported successfully.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { redirect_to :back, alert: 'Cannot report link :' + @report.errors.full_messages.join("<br/>") }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @link_id = params[:link_id]
    Link.where("id = ?", @link_id).destroy_all

    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Link and associated reports were successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:reason, :link_id)
    end
end
