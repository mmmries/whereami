class AppDelegate
  attr_reader :controller
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @controller = WhereamiController.alloc.initWithNibName('WhereamiViewController', bundle: nil)
    @window.rootViewController = @controller
    @window.makeKeyAndVisible
  end
end
