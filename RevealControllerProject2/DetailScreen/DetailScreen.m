//
//  DetailScreen.m
//  FunnyFood
//
//  Created by hoangdangtrung on 10/22/15.
//  Copyright © 2015 hoangdangtrung. All rights reserved.
//

#import "DetailScreen.h"
#import "CustomCell.h"
#import "DataItem.h"
#import "DataItems.h"
#import "ShowDetailScreen.h"

@interface DetailScreen ()

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation DetailScreen {
    NSMutableArray *arrayDataItems,*arrayDataItems2;

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self chooseDataItem];
    [self.tableView reloadData];
    self.title = self.stringTitleDetailScreen;
    
    DataItems *fruits = [[DataItems alloc] initWithTitle:@"Fruits" andData:@[@"Banana", @"Orange", @"Lemon"]];
    DataItems *things = [[DataItems alloc] initWithTitle:@"Things" andData:@[@"Clock", @"Guitar", @"Tivi", @"Wash Machine"]];
    DataItems *girls = [[DataItems alloc] initWithTitle:@"Girls" andData:@[@"Miranda Kerr", @"Kate Upton", @"Adriana Lima", @"Rosie Huntington-Whiteley"]];
    
    arrayDataItems2 = [[NSMutableArray alloc] initWithObjects:fruits,things,girls, nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    
}

- (void) chooseDataItem {
    if ([self.stringTitleDetailScreen isEqualToString:@"Ice Cream"]) {
        [self createDataIceCream];

    } }


- (void) createDataIceCream {
    
    DataItem *iceCream1 = [[DataItem alloc] initWithName:@"Kem Vani" andPrice:@"$23" withImage:@"cream01.jpg" andSaleOffPrice:@""];
    DataItem *iceCream2 = [[DataItem alloc] initWithName:@"Kem sữa dừa" andPrice:@"$12" withImage:@"cream02.jpg" andSaleOffPrice:@"-30%"];
    DataItem *iceCream3 = [[DataItem alloc] initWithName:@"Kem Rum nho" andPrice:@"$14" withImage:@"cream03.jpg" andSaleOffPrice:@"-10%"];
    
    arrayDataItems = [[NSMutableArray alloc] initWithObjects:iceCream1, iceCream2, iceCream3, nil];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [arrayDataItems2 count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    DataItems *items = arrayDataItems2[section];
    NSLog (@"%@",items.title);
    return items.title;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrayDataItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = (CustomCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    DataItem *dataItem = [[DataItem alloc] init];
    dataItem = arrayDataItems[indexPath.row];
    cell.labelName.text = dataItem.name;
    cell.labelPrice.text = dataItem.price;
    cell.imgViewThumbnail.image = dataItem.image;
    cell.labelSaleOff.text = dataItem.saleOff;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DataItem *dataItem = [[DataItem alloc] init];
    dataItem = arrayDataItems[indexPath.row];
    
    ShowDetailScreen *showDetailScreen = [[ShowDetailScreen alloc] init];
    showDetailScreen.imgFood = dataItem.image;
    showDetailScreen.stringNameFood = dataItem.name;
    showDetailScreen.stringPrice = dataItem.price;
    showDetailScreen.stringSaleOff = dataItem.saleOff;

    [self.navigationController pushViewController:showDetailScreen animated:YES];

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}



@end
