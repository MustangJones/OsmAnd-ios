//
//  OAMyDataViewController.m
//  OsmAnd
//
//  Created by Alexey Pelykh on 7/9/14.
//  Copyright (c) 2014 OsmAnd. All rights reserved.
//

#import "OAMyDataViewController.h"

#import <QuickDialog.h>

#import "OsmAndApp.h"
#import "OALog.h"
#include "Localization.h"

@interface OAMyDataViewController () <UIDocumentInteractionControllerDelegate>

@end

@implementation OAMyDataViewController
{
    OsmAndAppInstance _app;

    UIDocumentInteractionController* _exportController;
}

- (instancetype)init
{
    OsmAndAppInstance app = [OsmAndApp instance];

    QRootElement* rootElement = [[QRootElement alloc] init];

    rootElement.title = OALocalizedString(@"My data");
    rootElement.grouped = YES;
    rootElement.appearance.entryAlignment = NSTextAlignmentRight;

    // Favorites section:
    QSection* favoritesSection = [[QSection alloc] init];
    favoritesSection.title = OALocalizedString(@"Favorites");
    [rootElement addSection:favoritesSection];

    QLabelElement* manageFavoritesElement = [[QLabelElement alloc] initWithTitle:OALocalizedString(@"Manage")
                                                                           Value:nil];
    manageFavoritesElement.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    manageFavoritesElement.controllerAction = NSStringFromSelector(@selector(onManageFavorites));
    manageFavoritesElement.keepSelected = NO;
    [favoritesSection addElement:manageFavoritesElement];

    QLabelElement* exportFavoritesElement = [[QLabelElement alloc] initWithTitle:OALocalizedString(@"Export")
                                                                           Value:nil];
    exportFavoritesElement.controllerAction = NSStringFromSelector(@selector(onExportFavorites));
    exportFavoritesElement.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    exportFavoritesElement.keepSelected = NO;
    [favoritesSection addElement:exportFavoritesElement];

    self = [super initWithRoot:rootElement];
    if (self) {
        _app = app;
    }
    return self;
}

- (void)onManageFavorites
{
    OALog(@"onManageFavorites");
}

- (void)onExportFavorites
{
    NSURL* favoritesUrl = [NSURL fileURLWithPath:_app.favoritesStorageFilename];
    _exportController = [UIDocumentInteractionController interactionControllerWithURL:favoritesUrl];
    _exportController.UTI = @"net.osmand.gpx";
    _exportController.delegate = self;
    _exportController.name = OALocalizedString(@"OsmAnd Favorites.gpx");
    [_exportController presentOptionsMenuFromRect:CGRectZero
                                           inView:self.view
                                         animated:YES];
}

- (void)documentInteractionControllerDidDismissOptionsMenu:(UIDocumentInteractionController *)controller
{
    if (controller == _exportController)
        _exportController = nil;
}

- (void)documentInteractionControllerDidDismissOpenInMenu:(UIDocumentInteractionController *)controller
{
    if (controller == _exportController)
        _exportController = nil;
}

@end