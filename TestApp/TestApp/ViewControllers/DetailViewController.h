//
//  DetailViewController.h
//  TestApp
//
//  Created by Andrey on 12/03/2021.
//

#import <UIKit/UIKit.h>
#import "QTWelcome.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

- (instancetype)initWithModel:(QTArticle*)model;


@end

NS_ASSUME_NONNULL_END
