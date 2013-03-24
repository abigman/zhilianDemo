//
//  ChangeVocationViewController.m
//  ZhiLianLQX
//
//  Created by tony J on 13-2-20.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "ChangeVocationViewController.h"
#import "XMLReader.h"
@interface ChangeVocationViewController ()

@end
static NSDictionary *dic;
@implementation ChangeVocationViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        self.title = @"选择行业";

        self.arr = [NSMutableArray array];
//        [self.arr retain];

    
    }
    return self;
}

-(void)setStrBlock:(ChangeVocationViewControllerBlock)block
{
    if (strBlock != block)
    {
        [strBlock release];
        strBlock = [block copy];
    }
}

-(NSMutableArray *)IndusType
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"basedata" ofType:@"xml"];
    NSData *dataP = [NSData dataWithContentsOfFile:path];
    dic = [XMLReader dictionaryForXMLData:dataP error:nil];
    NSMutableDictionary *rootDic = [dic valueForKey:@"root"];
  //  NSLog(@"rootdic--------------->%@",rootDic);
    NSMutableDictionary *basedataDic = [rootDic valueForKey:@"basedata"];
   // NSLog(@"basedatadic--------------->%@",basedataDic);
    NSMutableDictionary *industryDic = [basedataDic valueForKey:@"industry"];
  //  NSLog(@"industryDic--------------->%@",industryDic);
    //    NSMutableDictionary *firstLevelDic = [cityDic valueForKey:@"firstLevel"];
    //    NSLog(@"firstLevelDic--------------->%@",firstLevelDic);
    NSMutableArray *itemArr = [industryDic valueForKey:@"item"];
    
    for (NSMutableDictionary *EndDic in itemArr) 
    {
        NSString *textStr = [EndDic valueForKey:@"text"];
        //NSLog(@"textStr--------------->%@",textStr);
        NSArray *arrs = [textStr componentsSeparatedByString:@" "];
        
        NSString *Newstr = [arrs objectAtIndex:[arrs count]-1];

        
        [self.arr addObject:Newstr];
    }
   // NSLog(@"arr==%@",self.arr);
    
    return self.arr;
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self IndusType];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    NSLog(@"%d",self.arr.count);
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:CellIdentifier] autorelease];
        
    }
    
    cell.textLabel.text = [self.arr objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:14];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.*/
    
    if (strBlock)
    {
        strBlock([tableView cellForRowAtIndexPath:indexPath].textLabel.text);
    }
    
     [self.navigationController popViewControllerAnimated:YES];
     
}

@end
