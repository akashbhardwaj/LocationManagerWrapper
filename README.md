# Location Manager Wrapper :)

Location Manager is a wrapper to use CLLocationManager (iOS Framework to use GPS) in a simpler way and getting
rid of all those delegates and error handling. Location Manager gives to both the functionalities for single time location getting as well as live tracking.
<h5> Features: </h5>
<ul>
        <li>Easy to use.</li>
        <li>Provide prior error handling.</li>
        <li>Adjust the location accuracy according to device battery percentage.</li>
        </ul>

<h2>How to use:</h2>
<ul>
<li><h4>Dont forget to add Add the "NSLocationWhenInUseUsageDescription" key and the "NSLocationAlwaysAndWhenInUseUsageDescription" key to your Info.plist file. (Xcode displays these keys as "Privacy - Location When In Use Usage Description" and "Privacy - Location Always and When In Use Usage Description" in the Info.plist editor.)</h4></li>
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
        Thanks! 😁😁😁
