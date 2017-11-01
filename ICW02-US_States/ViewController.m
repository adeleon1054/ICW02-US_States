//
//  ViewController.m
//  ICW02-US_States
//
//  Created by Asdruval De Leon on 10/30/17.
//  Copyright © 2017 Asdruval De Leon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *states, *statesCapital, *statesFlags, *statesShape;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    _states = @[@"Alabama", @"Alaska", @"Arizona", @"Arkansas", @"California", @"Colorado", @"Connecticut", @"Delaware",
                @"Florida", @"Georgia", @"Hawaii", @"Idaho", @"Illinois", @"Indiana", @"Iowa", @"Kansas", @"Kentucky",
                @"Louisiana", @"Maine", @"Maryland", @"Massachusetts", @"Michigan", @"Minnesota", @"Mississippi",
                @"Missouri"];
    
    _statesCapital = @[@"Montgomery", @"Juneau", @"Phoenix", @"Little Rock", @"Sacramento", @"Denver", @"Hartford",
                       @"Dover", @"Tallahassee", @"Atlanta", @"Honolulu", @"Boise", @"Springfield", @"Indianapolis",
                       @"Des Moines", @"Topeka", @"Frankfort", @"Baton Rouge", @"Augusta", @"Annapolis", @"Boston",
                       @"Lansing", @"St. Paul", @"Jackson", @"Jefferson City"];
    
    _statesFlags = @[@"al.png", @"ak.png", @"az.png", @"ar.png", @"ca.png", @"co.png", @"ct.png", @"de.png", @"fl.png",
                     @"ga.png", @"hi.png", @"id.png", @"il.png", @"in.png", @"ia.png", @"ks.png", @"ky.png", @"la.png",
                     @"me.png", @"md.png", @"ma.png", @"mi.png", @"mn.png", @"ms.png", @"mo.png"];
    
    _statesShape = @[@"ALABAMA", @"ALASKA", @"ARIZONA", @"ARKANSAS", @"CALIFORNIA", @"COLORADO", @"CONNECTICUT", @"DELAWARE",
                     @"FLORIDA", @"GEORGIA", @"HAWAII", @"IDAHO", @"ILLINOIS", @"INDIANA", @"IOWA", @"KANSAS", @"KENTUCKY",
                     @"LOUISIANA", @"MAINE", @"MARYLAND", @"MASSACHUSETTS", @"MICHIGAN", @"MINNESOTA", @"MISSISSIPPI",
                     @"MISSOURI"];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_states count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //Define the type of tabel cell
    static NSString* simpleTableIdentifier = @"SimpleTableIdentifier";
    
    //Ask the table to reuse previuosly used cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: simpleTableIdentifier];
    
    //if we need to re-create reusable cell, we test to see if nill (null)
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
    }
    
    //Display image on the left as default
    UIImage *image = [UIImage imageNamed:[_statesShape objectAtIndex:indexPath.row]];
    cell.imageView.image = image;
    
    //Display Title and Subtitle
    cell.textLabel.text = _states[indexPath.row];
    cell.detailTextLabel.text = _statesCapital[indexPath.row];
    
    //Display image on the right of the cell
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[_statesFlags objectAtIndex:indexPath.row]]];
    cell.accessoryView = imageView;
    
    cell.textLabel.font = [UIFont fontWithName:@"Verdana-BoldItalic" size:18];
    
    return cell;
}

#pragma mark UITableView Delegate Methods
//Alternate row color
- (void)tableView: (UITableView*)tableView willDisplayCell: (UITableViewCell*)cell forRowAtIndexPath: (NSIndexPath*)indexPath {
    
    if(indexPath.row % 2 == 0)
        cell.backgroundColor = [UIColor lightGrayColor];
    else
        cell.backgroundColor = [UIColor whiteColor];
}

//Row selection
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0)
        return nil;
    else
        return indexPath;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *rowState = _states[indexPath.row];
    NSString *rowStateCapital = _statesCapital[indexPath.row];
    NSString *message = [[NSString alloc]initWithFormat:@"You selected %@ and the capital is %@", rowState, rowStateCapital];
    
    NSLog(@"%@",message);
    
    //dismiss row selection
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
