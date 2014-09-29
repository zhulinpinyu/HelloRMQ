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
    @query = rmq.append(UITextField, :query).get
    rmq.append(UIButton, :submit_button).on(:touch) do |sender|
      p @query
    end
  end

  def init_nav
    self.title = 'zhulinpinyu'
  end

end