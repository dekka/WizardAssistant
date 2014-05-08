//
//  WASettingsViewController.m
//  WizardAssistant
//
//  Created by Reed Sweeney on 4/25/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import "WASettingsViewController.h"
#import "WAEditCell.h"
#import "WAAddPlayerCell.h"
#import "WAPlayer.h"
#import "WAViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "GameModel.h"


@interface WASettingsViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate,UIAlertViewDelegate>

@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (nonatomic) BOOL isEditing;
@property (nonatomic, weak) WAEditCell *editCell;
@property (nonatomic, strong) UITextField *playerNameTextField;

@end

@implementation WASettingsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.gameModel.formatIsEdh)
    {
        self.gameModel.formatIsEdh = YES;
        self.edhSwitch.On = YES;
    }
    else
    {
        self.gameModel.formatIsEdh = NO;
        self.edhSwitch.On = NO;
    }
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (_isEditing) {
        return MIN(self.gameModel.players.count, 6);
    } else {
        return MIN(self.gameModel.players.count + 1, 6);
    }
    
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"Selected Row: %d", indexPath.row);
    if (!_isEditing) {
        if ((indexPath.row == self.gameModel.players.count) && indexPath.row < 6) {

            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Name" message:@"Enter a name for this player" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"Done", nil];
           
            alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
            
            self.playerNameTextField = [alertView textFieldAtIndex:0];
            
            [alertView show];
            
            _isEditing = YES;
            //[_collectionView reloadData];
            //self.editCell = (WAEditCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
            
            
            
            //[self.editCell.nameField becomeFirstResponder];
        }
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.gameModel.players.count && !_isEditing && self.gameModel.players.count < 6)
    {
        WAAddPlayerCell *addPlayerCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AddPlayerCell" forIndexPath:indexPath];
        
        addPlayerCell.layer.borderWidth = 2.0f;
        addPlayerCell.layer.borderColor = [UIColor redColor].CGColor;
        
        
        return addPlayerCell;
        
    }
    else
    {
        WAEditCell *editCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"EditCell" forIndexPath:indexPath];
        WAPlayer *player = self.gameModel.players[indexPath.row];
        editCell.nameField.text = player.name;
        editCell.nameField.tag = indexPath.row;
        
        editCell.layer.borderWidth = 2.0f;
        editCell.layer.borderColor = [UIColor blueColor].CGColor;
        
        editCell.removePlayerButton.tag = indexPath.row;
        
        return editCell;
    }
    
}

- (IBAction)removePlayer:(id)sender
{
    UIButton *buttonPressed = (UIButton *)sender;
    [self.gameModel.players removeObjectAtIndex:buttonPressed.tag];
    
    _isEditing = NO;
    
    [self.collectionView reloadData];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    WAPlayer *player = [self.gameModel.players objectAtIndex:textField.tag];
    player.name = textField.text;

    _isEditing = NO;
    
    [textField resignFirstResponder];
    
    [_collectionView reloadData];
    
    return YES;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)handleExit:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)edhSwitchChanged:(id)sender
{
    if (self.gameModel.gameInProgress)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Whoa Playa" message:@"You need to reset your game first" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [alertView show];
        [self.edhSwitch setOn:(!self.edhSwitch.on) animated:YES];
    }
    else {
        [self.delegate edhModeChanged];
    }
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
   
     if (buttonIndex == 1)
     {
         WAPlayer *player = [[WAPlayer alloc] init];
         [player setupPlayerWithName:self.playerNameTextField.text AndFormat:self.gameModel.formatIsEdh];
         [self.gameModel.players addObject:player];
         [self.collectionView reloadData];
         _isEditing = NO;
     }
}





@end














