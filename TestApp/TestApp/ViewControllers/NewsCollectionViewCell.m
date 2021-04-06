//
//  NewsCollectionViewCell.m
//  TestApp
//
//  Created by Andrey on 21/03/2021.
//

#import "NewsCollectionViewCell.h"

@implementation NewsCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, [self.contentView bounds].size.width - 20, 20)];
        self.backgroundColor = UIColor.greenColor;
        [self.mainLabel setTextColor:[UIColor redColor]];
        [self.mainLabel setBackgroundColor:[UIColor whiteColor]];
        [self.mainLabel setTextAlignment:NSTextAlignmentCenter];
        [self.mainLabel setFont:[UIFont systemFontOfSize:12 weight:UIFontWeightBold]];
        [self.contentView addSubview:self.mainLabel];
        
        self.detailsLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, [self.contentView bounds].size.width - 20, 50)];
        self.backgroundColor = UIColor.grayColor;
        self.detailsLabel.numberOfLines = 0;
        self.detailsLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [self.detailsLabel setTextColor:[UIColor grayColor]];
        [self.detailsLabel setBackgroundColor:[UIColor whiteColor]];
        [self.detailsLabel setTextAlignment:NSTextAlignmentCenter];
        [self.detailsLabel setFont:[UIFont systemFontOfSize:12 weight:UIFontWeightBold]];
        [self.contentView addSubview:self.detailsLabel];

    }
    return self;
}


@end
