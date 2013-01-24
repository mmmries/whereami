class WhereamiController < UIViewController
  extend IB
  attr_reader :location_manager, :last_location

  ## ib outlets
  outlet :worldView, MKMapView
  outlet :activityIndicator, UIActivityIndicatorView
  outlet :locationTitleField, UITextField

  def viewDidLoad
    @location_manager = CLLocationManager.alloc.init
    location_manager.setDelegate(self)
    location_manager.setDesiredAccuracy(KCLLocationAccuracyBest)
  end

  #MKMapViewDelegate
  def mapView( map, didUpdateUserLocation: location)
    @last_location = location
    coord = location.coordinate
    region = MKCoordinateRegionMakeWithDistance(coord, 250, 250)
    worldView.setRegion(region, animated:true)
  end

  #UITextFieldDelegate
  def textFieldShouldReturn(field)
    field.resignFirstResponder
    find_location
    true
  end

  def locationManager(man, didUpdateToLocation:to, fromLocation: from)
    found_location(to)
  end

private
  def find_location
    location_manager.startUpdatingLocation
    activityIndicator.startAnimating
    locationTitleField.setHidden(true)
  end

  def found_location(loc)
    coord = loc.coordinate
    point = BNRMapPoint.new(coord, locationTitleField.text)
    worldView.addAnnotation(point)
    location_manager.stopUpdatingLocation
    activityIndicator.stopAnimating
    locationTitleField.setText("")
    locationTitleField.setHidden(false)
  end
end
