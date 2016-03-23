//
//  ViewController.m
//  testGit
//
//  Created by jhon on 16/1/21.
//  Copyright © 2016年 jhon. All rights reserved.
//

#import "ViewController.h"
#import "OtherViewController.h"
#import <objc/message.h>


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,copy)NSArray * methodNameArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.translucent = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor clearColor];
    
    CGSize size = self.view.frame.size;
    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseId"];

    self.navigationItem.title = @"哈哈";
    
    [[self.navigationController.navigationBar subviews]objectAtIndex:0].alpha = 0;
        
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80)];
//    imageView.image = [UIImage imageNamed:@"Default.png"];
    imageView.backgroundColor = [UIColor purpleColor];
    
    tableView.tableHeaderView = imageView;
    
    
    [self loadData];
    
    
}

- (void)loadData{
    _methodNameArray = @[@"pushToFirstVC:",@"pushToSecondVC:",@"pushToThirdVC:"];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseId"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * methodName = _methodNameArray[indexPath.row];
    SEL methodSel = NSSelectorFromString(methodName);
    if ([self respondsToSelector:methodSel]) {
        ((void(*)(id,SEL,NSInteger))objc_msgSend)(self,methodSel,indexPath.row + 1);
    }
}

- (void)pushToFirstVC:(NSInteger)index{
    
    OtherViewController * otherVC = [[OtherViewController alloc]init];
    otherVC.index = index;
    [self.navigationController pushViewController:otherVC animated:YES];
}
- (void)pushToSecondVC:(NSInteger)index{
    OtherViewController * otherVC = [[OtherViewController alloc]init];
    otherVC.index = index;
    [self.navigationController pushViewController:otherVC animated:YES];
}
- (void)pushToThirdVC:(NSInteger)index{
    OtherViewController * otherVC = [[OtherViewController alloc]init];
    otherVC.index = index;
    [self.navigationController pushViewController:otherVC animated:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
