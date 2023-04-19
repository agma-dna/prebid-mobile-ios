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

#import <Foundation/Foundation.h>

@class PBMBid;
@class PBMAdUnitConfig;

@protocol PBMAdLoaderFlowDelegate;
@protocol PBMPrimaryAdRequesterProtocol;

NS_ASSUME_NONNULL_BEGIN

@protocol PBMAdLoaderProtocol <NSObject>

@property (nonatomic, weak, nullable) id<PBMAdLoaderFlowDelegate> flowDelegate;

@property (nonatomic, readonly) id<PBMPrimaryAdRequesterProtocol> primaryAdRequester;

- (void)createPrebidAdWithBid:(PBMBid *)bid
                 adUnitConfig:(PBMAdUnitConfig *)adUnitConfig
                adObjectSaver:(void (^)(id))adObjectSaver
            loadMethodInvoker:(void (^)(dispatch_block_t))loadMethodInvoker;

- (void)reportSuccessWithAdObject:(id)adObject adSize:(nullable NSValue *)adSize;

@end

NS_ASSUME_NONNULL_END
