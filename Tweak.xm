@interface VKAudioBackgroundStreamingManager : NSObject
@end

// Disable 30 min audio
%hook VKAudioBackgroundStreamingManager
- (BOOL)canListenBackground {
    return YES;
}
%end

// Hide Large title
%hook DialogsController
- (BOOL)VKMControllerMessengerSupportLargeTitle {
    return NO;
}
%end

%hook DialogsContainerController
- (BOOL)VKMControllerMessengerSupportLargeTitle {
    return NO;
}
%end

%hook ContactListController
- (BOOL)VKMControllerMessengerSupportLargeTitle {
    return NO;
}
%end

%hook ContactsSelectionListController
- (BOOL)VKMControllerMessengerSupportLargeTitle {
    return NO;
}
%end

%hook ModerSettingsController
- (BOOL)VKMControllerMessengerSupportLargeTitle {
    return NO;
}
%end

//Settings

%hook _TtC8Milligan17MILToggleProvider

- (BOOL)nativePictureInPictureEnabled { //Picture In Picture
    return YES;
}

- (BOOL)pictureInPictureEnabled { //Picture In Picture
    return YES;
}

- (BOOL)videoOnePlayerAirPlay { //AirPlay
    return YES;
}

- (BOOL)largeDocsUploadEnabled { //large docs upload ~ загрузка больших документов
    return YES;
}

/*- (BOOL)videoOnePlayerEnabledEverywhere { // Картинка картинка вне приложения, пока глючит + chromecast
    return YES;
}

- (BOOL)chromecastEnabled { //chromecast
    return YES;
}

- (BOOL)videoOnePlayerPreferHLS {
    return YES;
}

- (BOOL)relocatesProfileMenu { //меню профиля сбоку
    return YES;
}*/

%end

// Add quick action
%hook AppDelegate

- (id)init {
    %orig;

    UIApplicationShortcutIcon *postIcon = [UIApplicationShortcutIcon iconWithTemplateImageName:@"write_outline_28"];
    UIApplicationShortcutIcon *photoIcon = [UIApplicationShortcutIcon iconWithTemplateImageName:@"picture_outline_28"];
    
    UIMutableApplicationShortcutItem *vkPost = [[%c(UIMutableApplicationShortcutItem) alloc] initWithType:@"post" localizedTitle:[[NSBundle mainBundle] localizedStringForKey:@"wall_new_post" value:@"" table:@"Localizable"] localizedSubtitle:nil icon:postIcon userInfo:nil];
    UIMutableApplicationShortcutItem *vkPhoto = [[%c(UIMutableApplicationShortcutItem) alloc] initWithType:@"photo" localizedTitle:[[NSBundle mainBundle] localizedStringForKey:@"profile_info_add_photo" value:@"" table:@"Localizable"] localizedSubtitle:nil icon:photoIcon userInfo:nil];
    
    [[UIApplication sharedApplication] setShortcutItems: @[ vkPost, vkPhoto ]];
    
    return %orig;
}

%end
