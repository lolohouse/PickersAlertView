//
//  ViewController.m
//  PickerAlertView
//
//  Created by juxue.chen on 8/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PickerViewController.h"
#import "DatePickerAlertView.h"
#import "PickerAlertView.h"

@implementation PickerViewController

int ValorSeleccionado= -1;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return TRUE;
}

- (void) viewDidLoad 
{
	label = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 120, 40)];
	label.text = @"日期";
	[self.view addSubview:label];
	
	UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	button.frame = CGRectMake(100, 50, 230, 40);
	[button addTarget:self action:@selector(DatepickerAction) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
    
    
    
    UIButton *buttonPicker = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	buttonPicker.frame = CGRectMake(50, 150, 230, 40);
	[buttonPicker addTarget:self action:@selector(pickerAction) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:buttonPicker];

}

- (void)DatepickerAction 
{
	DatePickerAlertView *pickerAlertView = [[DatePickerAlertView alloc] initWithTitle:@"titulo" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
	[pickerAlertView show];
}

- (void)pickerAction 
{
	PickerAlertView *pobjPickerAlertView = [[PickerAlertView alloc] initWithTitle:@"titulo" message:@"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    
    
	[pobjPickerAlertView show];
}

#pragma mark UIAlertViewDelegate 
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([alertView isKindOfClass:[DatePickerAlertView class]]) 
    {
        DatePickerAlertView *dateAlert = (DatePickerAlertView*) alertView;
        
        NSString *dateFromData = [NSString stringWithFormat:@"%@",dateAlert.DatePicker.date];
        NSString *date = [dateFromData substringWithRange:NSMakeRange(0, 10)];
        label.text = date;
        NSLog(@"date %@...%@",date,dateAlert.DatePicker.date);
    }
    else 
    {
         PickerAlertView *dateAlert = (PickerAlertView*) alertView;
        if (buttonIndex ==0) 
        {  // selecciono OK
                label.text =[NSString stringWithFormat:@"Selec-> %d",[dateAlert.Picker selectedRowInComponent:0]];
        }
    }
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 7;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%d",row];
}

@end
