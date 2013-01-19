class WhereamiController < UIViewController
  extend IB

  ## ib outlets
  outlet :worldView, MKMapView
  outlet :activityIndicator, UIActivityIndicatorView
  outlet :locationTitleField, UITextField

end
