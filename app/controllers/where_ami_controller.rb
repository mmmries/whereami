class WhereamiController < UIViewController
  extend IB

  ## ib outlets
  outlet :worldView, MKMapView
  outlet :activityIndicator, UIActivityIndicatorView
  outlet :locationTitleField, UITextField

  #MapViewDelegated
  def mapView( map, didUpdateUserLocation: location)
    coord = location.coordinate
    region = MKCoordinateRegionMakeWithDistance(coord, 250, 250)
    worldView.setRegion(region, animated:true)
  end
end
