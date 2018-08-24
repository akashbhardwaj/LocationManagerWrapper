# LocationManagerWrapper

Location Manager is a wrapper to user CLLocation Manager (iOS Framework to use GPS) in a simpler way and getting
rid of all those delegates and error handling.


<h2>How to use:</h2>
<ul>
<li><h3>1.For getting location for a single time: </h3>
<pre>
<code>
        let locationManager = LocationManager(withAccuracy: LMLocationAccuracy.bestForNavigation)
        locationManager.getCurrentLocation { (response) in
            switch response {
            case .failure(let locationError):
                switch locationError {
                case .authorizationFailed(let description):
                    print(description)
                case .locationUpdationFailed(let description):
                    print(description)
                }
            case .success(let location):
                print("location is :", location)
                self.lbllat.text = "\(location.coordinate.latitude)"
                self.lblLong.text = "\(location.coordinate.longitude)"
            }
        }
</code> 
</pre>
    </li>
<li> <h3> 2. For live tracking: </h3>
<pre>
<code>
        let locationManager = LocationManager(withAccuracy: LMLocationAccuracy.bestForNavigation)
        
         locationManager.startLiveTracking { (response) -> Bool in
            switch response {
                            case .failure(let locationError):
                                switch locationError {
                                case .authorizationFailed(let description):
                                    print(description)
                                case .locationUpdationFailed(let description):
                                    print(description)
                                }
                            case .success(let location):
                                print("location is :", location)
                                self.lbllat.text = "\(location.coordinate.latitude)"
                                self.lblLong.text = "\(location.coordinate.longitude)"
                            }
            return true  
        }
</code>
</pre>
<p><b>**</b>The returning bool in live tracking closure ensure when to stop updating location return false when u want to stop location to update and return true to continue updating location.</p>
</li>
</ul>
        
