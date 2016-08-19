# MLAlertController

## Show UIAlertController like UIAlertView

### Usage

#### with completionHandler

```
    [[MLAlertController sharedInstance] showAlertWithTitle:@"Fetch" message:@"My API" cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok" completion:^(UIAlertController *alertViewController, NSInteger buttonIndex) {
        if (buttonIndex == kAlertActionCancel) {
            NSLog(@"cancelled!");
        }
        else if (buttonIndex == kAlertActionOther) {
            NSLog(@"other!");
        }
    }];
```

#### with color
```
    [[MLAlertController sharedInstance] showAlertWithColor:[UIColor redColor] title:@"Fetch with Color" message:@"Cool!" cancelButtonTitle:@"Ok" otherButtonTitles:nil completion:nil];
```