//
//  SearchResultsViewController.h
//  TestApp
//
//  Created by Andrey on 21/03/2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchResultsViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *results;

- (void)update;

@end

NS_ASSUME_NONNULL_END
