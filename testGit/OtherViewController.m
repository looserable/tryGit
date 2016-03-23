//
//  OtherViewController.m
//  testGit
//
//  Created by john on 16/3/23.
//  Copyright © 2016年 jhon. All rights reserved.
//

#import "OtherViewController.h"

@interface OtherViewController ()


@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.translucent = NO;

    
    self.view.backgroundColor = [UIColor clearColor];
    
    self.navigationItem.title = [NSString stringWithFormat:@"这是第%ld个页面",_index];
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithTitle:@"邮右边" style:UIBarButtonItemStyleDone target:self action:nil];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    UIScrollView * scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    [self.view addSubview:scrollview];
    scrollview.backgroundColor = [UIColor cyanColor];
    
    scrollview.contentSize = CGSizeMake(size.width, size.height + 500);
    
    UIImageView * imageVC = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
//    imageVC.image = [UIImage imageNamed:@"Default.png"];
    imageVC.backgroundColor = [UIColor orangeColor];
    [scrollview addSubview:imageVC];
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
