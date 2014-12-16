//
//  OsmAndAppCppProtocol.h
//  OsmAnd
//
//  Created by Alexey Pelykh on 2/25/14.
//  Copyright (c) 2014 OsmAnd. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "OAMapViewState.h"

#include <OsmAndCore/QtExtensions.h>
#include <QDir>

#include <OsmAndCore.h>
#include <OsmAndCore/ResourcesManager.h>
#include <OsmAndCore/FavoriteLocationsGpxCollection.h>
#include <OsmAndCore/GpxDocument.h>

@protocol OsmAndAppCppProtocol <NSObject>
@required

@property(nonatomic, readonly) QDir dataDir;
@property(nonatomic, readonly) QDir documentsDir;
@property(nonatomic, readonly) QDir cacheDir;

@property(nonatomic, readonly) std::shared_ptr<OsmAnd::ResourcesManager> resourcesManager;
@property(nonatomic, readonly) std::shared_ptr<OsmAnd::FavoriteLocationsGpxCollection> favoritesCollection;
@property(nonatomic) std::shared_ptr<OsmAnd::GpxDocument> gpxCollection;

@end
