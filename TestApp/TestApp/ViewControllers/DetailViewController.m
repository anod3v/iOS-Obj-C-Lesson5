//
//  DetailViewController.m
//  TestApp
//
//  Created by Andrey on 12/03/2021.
//

#import "DetailViewController.h"
#import "QTWelcome.h"

@interface DetailViewController ()

@property (nonatomic, strong) UILabel *articleDescriptionLabel;

@property (nonatomic, strong) QTArticle *model;

@end

@implementation DetailViewController

- (instancetype)initWithModel:(QTArticle*)model {
    self = [super init];
    
    if (self) {
        [self setModel:model];
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.model.author != [NSNull null]) {
        [self setTitle:self.model.author];
    } else {
        [self setTitle:@"placeholder text"];
    }
    
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.articleDescriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                  150,
                                                                  self.view.bounds.size.width,
                                                                   300)];
    UIFont *font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
    self.articleDescriptionLabel.numberOfLines = 0;
    self.articleDescriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [self.articleDescriptionLabel setFont:font];
    if (self.model.theDescription != [NSNull null]) {
        [self.articleDescriptionLabel setText:self.model.theDescription];
    } else {
        [self.articleDescriptionLabel setText:@"placeholder text"];
    }
    [self.view addSubview:self.articleDescriptionLabel];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(backButtonTap)];
    [self.navigationItem setLeftBarButtonItem:item];
}

- (void)backButtonTap {
    if (self.navigationController.navigationController == nil) {
        // Present
        [self.navigationController dismissViewControllerAnimated:true completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:true];
    }
}

@end

