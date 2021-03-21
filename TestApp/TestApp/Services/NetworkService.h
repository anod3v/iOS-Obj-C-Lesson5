//
//  NetworkService.h
//  TestApp
//
//  Created by Andrey on 12/03/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkService : NSObject

+ (instancetype)sharedInstance;

- (void)getNews:(void (^)(NSArray *news))completion;

@end

NS_ASSUME_NONNULL_END
