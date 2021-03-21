//
//  ViewController.m
//  TestApp
//
//  Created by Andrey on 08/03/2021.
//

#import "ViewController.h"
#import "NetworkService.h"
#import "DetailViewController.h"
#import "QTWelcome.h"
#import "NewsCollectionViewCell.h"

@interface ViewController ()

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *news;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    [self setTitle:@"Tesla News"];
    [self.navigationController.navigationBar setPrefersLargeTitles:YES];
 
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 10.0;
    layout.minimumInteritemSpacing = 10;
    layout.itemSize = CGSizeMake(100, 100);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
    [self.collectionView registerClass:[NewsCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    
    [self.view addSubview:self.collectionView];
    
    self.news = [NSMutableArray new];
    
    [[NetworkService sharedInstance] getNews:^(NSArray *news) {
        [self.news addObjectsFromArray:news];

        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
    }];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.news count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NewsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"Cell" forIndexPath:indexPath];
    if (cell == nil) {
    }
    QTArticle *model = [self.news objectAtIndex:indexPath.row];
    if (model.author != [NSNull null]) {
        cell.mainLabel.text = [model author];
    } else {
        cell.mainLabel.text = @"placeholder text";
    }
    
    if (model.theDescription != [NSNull null]) {
        cell.detailsLabel.text = [model theDescription];
    } else {
        cell.detailsLabel.text = @"placeholder text";
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    QTArticle *model = [self.news objectAtIndex:indexPath.row];
    DetailViewController *vc = [[DetailViewController alloc] initWithModel:model];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:true completion:nil];
}

@end
