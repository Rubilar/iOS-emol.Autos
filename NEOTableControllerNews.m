//
//  NEOTableControllerNews.m
//  Emol Autos
//
//  Created by Nicolas Rubilar on 25-07-13.
//  Copyright (c) 2013 com.neonline. All rights reserved.
//

#import "NEOTableControllerNews.h"
#import "NEODetailControllerNews.h"
#import "NEOCellControllerNews.h"

@interface NEOTableControllerNews()
{
    UIRefreshControl *refreshControl;
}
@end

@implementation NEOTableControllerNews
@synthesize datasource, tableView;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidLoad
{
    [self setupArray];
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    refreshControl = [[UIRefreshControl alloc]init];
    
    [refreshControl addTarget:self action:@selector(refreshTableview) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)refreshTableview
{
    [self.tableView reloadData];
    [refreshControl endRefreshing];
}

-(void)setupArray
{
    arrayTitle = [[NSArray alloc]initWithObjects:@"Renuevan el 308", @"Peugeot 208 GTi y XY", @"Nissan, lanzamiento regional", nil];
    arrayDescentTitle = [[NSArray alloc]initWithObjects:@"Peugeot dio a conocer el renovado 308 construido en la nueva plataforma de PSA. Se ha reducido su altura y se ha aumentado la distancia entre ejes.", @"Peugeot presenta en Chile las dos versiones más atrevidas del exitoso compacto de origen francés.", @"Este mes llegará a Chile el nuevo hatchback de Nissan. En versiones Sense y Advance, este vehículo conquista por su comodidad y eficiencia.", nil];
    arrayImageNews = [[NSArray alloc]initWithObjects:@"img_noticia1.jpg", @"img_noticia2.jpg", @"img_noticia3.jpg", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayTitle.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIndentifier = @"cellNews";
    
    NEOCellControllerNews *cell = [tableView dequeueReusableCellWithIdentifier:CellIndentifier];
    
    if (!cell){
        cell = [[NEOCellControllerNews alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIndentifier];
    }
    
    cell.title.text = [arrayTitle objectAtIndex:indexPath.row];
    cell.descentTitle.text = [arrayDescentTitle objectAtIndex:indexPath.row];
    cell.imageNews.image = [UIImage imageNamed:[arrayImageNews objectAtIndex:indexPath.row]];

    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NEODetailControllerNews *detailNews = [self.storyboard instantiateViewControllerWithIdentifier:@"detailNews"];
    detailNews.title= [arrayTitle objectAtIndex:indexPath.row];
    detailNews.descentTitle= [arrayDescentTitle objectAtIndex:indexPath.row];
    detailNews.imageNews= [arrayImageNews objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:detailNews animated:YES];
    
}

@end
