/*   Copyright 2018-2021 Prebid.org, Inc.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import UIKit
import PrebidMobile
import AppLovinSDK

@objcMembers
public class MAXMediationRewardedUtils: NSObject, PrebidMediationDelegate {
    
    public var rewardedAd: MARewardedAd
    
    var mediationValues: [String: Any]?
    
    public init(rewardedAd: MARewardedAd) {
        self.rewardedAd = rewardedAd
        super.init()
    }
    
    public func setUpAdObject(with values: [String: Any]) -> Bool {
        mediationValues = values
        values.forEach { key, value in
            rewardedAd.setLocalExtraParameterForKey(key, value: value)
        }
        
        return true
    }
    
    public func cleanUpAdObject() {
        mediationValues?.forEach({ key, _ in
            rewardedAd.setLocalExtraParameterForKey(key, value: nil)
        })
    }
    
    public func getAdView() -> UIView? {
        return nil
    }
}
