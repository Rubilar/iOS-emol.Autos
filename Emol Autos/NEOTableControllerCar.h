//
//  NEOTableControllerCar.h
//  Emol Autos
//
//  Created by Nicolas Rubilar on 18-07-13.
//  Copyright (c) 2013 com.neonline. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NEOTableControllerCar : UITableViewController<UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray *arrayBrand;
    NSMutableArray *arrayModel;
    NSMutableArray *arrayImageCar;
    NSMutableArray *arrayPrice;
    NSMutableArray *arrayYear;
    NSMutableArray *arrayKms;
    NSMutableArray *arrayAviso;
    
}

@property(nonatomic, retain)NSArray *datasource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
-(void)setupArray;

@end
