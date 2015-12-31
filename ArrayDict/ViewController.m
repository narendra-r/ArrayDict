//
//  ViewController.m
//  ArrayDict
//
//  Created by Kvana Mac Pro 2 on 12/31/15.
//  Copyright © 2015 Kvana Mac Pro 2. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSMutableArray *mainArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    mainArray=[[NSMutableArray alloc]init];
    NSArray  *innerArray1=@[
                            @{
                                @"title":@"wifi",
                                @"image":@"ic_settings_input_antenna"
                              }
                            ,@{
                                @"title":@"sim settings",
                                @"image":@"ic_settings_input_antenna"
                                }
                            ,@{
                                @"title":@"Mobile Data",
                                @"image":@"ic_settings_input_antenna"
                                }
                            ];
    
    NSArray  *innerArray2=@[
                            @{
                                @"title":@"Display",
                                @"image":@"ic_settings_input_antenna"
                                }
                            ,@{
                                @"title":@"Brightness",
                                @"image":@"ic_settings_input_antenna"
                                }
                            ,@{
                                @"title":@"Wall paper",
                                @"image":@"ic_settings_input_antenna"
                                }
                            ];
    [mainArray addObject:innerArray1];
    [mainArray addObject:innerArray2];
    UITableView *tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 500)];
    tableView.delegate=self;
    tableView.dataSource=self;
    [self.view addSubview:tableView];


}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 170;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return mainArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[mainArray objectAtIndex:section] count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CELLIDENTIFER=@"CELL";
    
    UIImageView *imageView;
    UILabel *lableView;
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CELLIDENTIFER];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELLIDENTIFER];
        imageView=[[UIImageView alloc]initWithFrame:CGRectMake(30, 10, 50, 50)];
        [cell addSubview:imageView];
        lableView=[[UILabel alloc]initWithFrame:CGRectMake(100, 20, 200, 40)];
        [cell addSubview:lableView];
        
    }
    
    NSArray *array=[mainArray objectAtIndex:indexPath.section];
    NSDictionary *dict=[array objectAtIndex:indexPath.row];
    lableView.text=[dict valueForKey:@"title"];
    imageView.image=[UIImage imageNamed:[dict valueForKey:@"image"]];

    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}








@end
