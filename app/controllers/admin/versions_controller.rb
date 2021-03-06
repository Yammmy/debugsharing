class Admin::VersionsController < AdminController
  def index
    @versions = PaperTrail::Version.includes(:item).order("id DESC").paginate(page: params[:page])
  end

  def undo
    @version = PaperTrail::Version.find(params[:version_id])
    @version.reify.save!

    redirect_to admin_versions_path
  end
end
