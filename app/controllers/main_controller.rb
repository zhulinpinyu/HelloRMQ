class MainController < UIViewController 

  def viewDidLoad
    super

    # Sets a top of 0 to be below the navigation control, it's best not to do this
    # self.edgesForExtendedLayout = UIRectEdgeNone

    rmq.stylesheet = MainStylesheet
    init_nav
    rmq(self.view).apply_style :root_view

    # Create your UIViews here
    rmq.append(UILabel, :search_label)
    @query = rmq.append(UITextField, :query).focus.get
    rmq.append(UIButton, :submit_button).on(:touch) do |sender|
      search_for_images @query.text
    end
  end

  def init_nav
    self.title = 'zhulinpinyu'
  end

  def search_for_images(query)
    if query && !query.strip.empty?
      query = query.gsub(/\s/,'%20')
      url = "https://secure.flickr.com/search/?q=#{query}&s=int"
      rmq.animations.start_spinner
      AFMotion::HTTP.get(url) do |result|
        if html = result.body
          images = html.scan(/src=\"(.+?\.jpg)\"/).map do |m|
            m.first
          end
          open_images_controller(images) if images.length > 0
        end
        rmq.animations.stop_spinner
      end
    end
  end

  def open_images_controller(images)
    controller = ImagesController.new
    controller.images = images
    controller.query = @query.text
    self.navigationController.pushViewController(controller, animated:true)
  end
end