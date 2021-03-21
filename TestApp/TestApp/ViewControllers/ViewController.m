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

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *news;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    [self setTitle:@"Tesla News"];
    [self.navigationController.navigationBar setPrefersLargeTitles:YES];
    
    self.news = [NSMutableArray new];
    
    [[NetworkService sharedInstance] getNews:^(NSArray *news) {
        [self.news addObjectsFromArray:news];

        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.news count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"Cell"];
    }
    QTArticle *model = [self.news objectAtIndex:indexPath.row];
    if (model.author != [NSNull null]) {
        cell.textLabel.text = [model author];
    } else {
        cell.textLabel.text = @"placeholder text";
    }
    
    if (model.theDescription != [NSNull null]) {
        cell.detailTextLabel.text = [model theDescription];
    } else {
        cell.textLabel.text = @"placeholder text";
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    QTArticle *model = [self.news objectAtIndex:indexPath.row];
    DetailViewController *vc = [[DetailViewController alloc] initWithModel:model];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
//    [vc setModel:model];
//    [self.navigationController pushViewController:vc animated:true];
    [self presentViewController:nav animated:true completion:nil];
}

@end
