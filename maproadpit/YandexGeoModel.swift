//
//  YandexGeoModel.swift
//  maproadpit
//
//  Created by Дмитрий Лисин on 20.11.2019.
//  Copyright © 2019 Дмитрий Лисин. All rights reserved.
//

import Foundation

// MARK: - YandexGeo
public struct YandexGeoModel: Codable {
    public let response: Response?

    public init(response: Response?) {
        self.response = response
    }
}

// MARK: - Response
public struct Response: Codable {
    public let geoObjectCollection: GeoObjectCollection?

    enum CodingKeys: String, CodingKey {
        case geoObjectCollection
    }

    public init(geoObjectCollection: GeoObjectCollection?) {
        self.geoObjectCollection = geoObjectCollection
    }
}

// MARK: - GeoObjectCollection
public struct GeoObjectCollection: Codable {
    public let metaDataProperty: GeoObjectCollectionMetaDataProperty?
    public let featureMember: [FeatureMember]?

    public init(metaDataProperty: GeoObjectCollectionMetaDataProperty?, featureMember: [FeatureMember]?) {
        self.metaDataProperty = metaDataProperty
        self.featureMember = featureMember
    }
}

// MARK: - FeatureMember
public struct FeatureMember: Codable {
    public let geoObject: GeoObject?

    enum CodingKeys: String, CodingKey {
        case geoObject
    }

    public init(geoObject: GeoObject?) {
        self.geoObject = geoObject
    }
}

// MARK: - GeoObject
public struct GeoObject: Codable {
    public let metaDataProperty: GeoObjectMetaDataProperty?
    public let name, geoObjectDescription: String?
    public let boundedBy: BoundedBy?
    public let point: Point?

    enum CodingKeys: String, CodingKey {
        case metaDataProperty, name
        case geoObjectDescription
        case boundedBy
        case point
    }

    public init(metaDataProperty: GeoObjectMetaDataProperty?, name: String?, geoObjectDescription: String?, boundedBy: BoundedBy?, point: Point?) {
        self.metaDataProperty = metaDataProperty
        self.name = name
        self.geoObjectDescription = geoObjectDescription
        self.boundedBy = boundedBy
        self.point = point
    }
}

// MARK: - BoundedBy
public struct BoundedBy: Codable {
    public let envelope: Envelope?

    enum CodingKeys: String, CodingKey {
        case envelope
    }

    public init(envelope: Envelope?) {
        self.envelope = envelope
    }
}

// MARK: - Envelope
public struct Envelope: Codable {
    public let lowerCorner, upperCorner: String?

    public init(lowerCorner: String?, upperCorner: String?) {
        self.lowerCorner = lowerCorner
        self.upperCorner = upperCorner
    }
}

// MARK: - GeoObjectMetaDataProperty
public struct GeoObjectMetaDataProperty: Codable {
    public let geocoderMetaData: GeocoderMetaData?

    enum CodingKeys: String, CodingKey {
        case geocoderMetaData
    }

    public init(geocoderMetaData: GeocoderMetaData?) {
        self.geocoderMetaData = geocoderMetaData
    }
}

// MARK: - GeocoderMetaData
public struct GeocoderMetaData: Codable {
    public let precision, text, kind: String?
    public let address: Address?
    public let addressDetails: AddressDetails?

    enum CodingKeys: String, CodingKey {
        case precision, text, kind
        case address
        case addressDetails
    }

    public init(precision: String?, text: String?, kind: String?, address: Address?, addressDetails: AddressDetails?) {
        self.precision = precision
        self.text = text
        self.kind = kind
        self.address = address
        self.addressDetails = addressDetails
    }
}

// MARK: - Address
public struct Address: Codable {
    public let countryCode, formatted, postalCode: String?
    public let components: [Component]?

    enum CodingKeys: String, CodingKey {
        case countryCode
        case formatted
        case postalCode
        case components
    }

    public init(countryCode: String?, formatted: String?, postalCode: String?, components: [Component]?) {
        self.countryCode = countryCode
        self.formatted = formatted
        self.postalCode = postalCode
        self.components = components
    }
}

// MARK: - Component
public struct Component: Codable {
    public let kind, name: String?

    public init(kind: String?, name: String?) {
        self.kind = kind
        self.name = name
    }
}

// MARK: - AddressDetails
public struct AddressDetails: Codable {
    public let country: Country?

    enum CodingKeys: String, CodingKey {
        case country
    }

    public init(country: Country?) {
        self.country = country
    }
}

// MARK: - Country
public struct Country: Codable {
    public let addressLine, countryNameCode, countryName: String?
    public let administrativeArea: AdministrativeArea?

    enum CodingKeys: String, CodingKey {
        case addressLine
        case countryNameCode
        case countryName
        case administrativeArea
    }

    public init(addressLine: String?, countryNameCode: String?, countryName: String?, administrativeArea: AdministrativeArea?) {
        self.addressLine = addressLine
        self.countryNameCode = countryNameCode
        self.countryName = countryName
        self.administrativeArea = administrativeArea
    }
}

// MARK: - AdministrativeArea
public struct AdministrativeArea: Codable {
    public let administrativeAreaName: String?
    public let locality: Locality?

    enum CodingKeys: String, CodingKey {
        case administrativeAreaName
        case locality
    }

    public init(administrativeAreaName: String?, locality: Locality?) {
        self.administrativeAreaName = administrativeAreaName
        self.locality = locality
    }
}

// MARK: - Locality
public struct Locality: Codable {
    public let localityName: String?
    public let thoroughfare: Thoroughfare?
    public let dependentLocality: LocalityDependentLocality?

    enum CodingKeys: String, CodingKey {
        case localityName
        case thoroughfare
        case dependentLocality
    }

    public init(localityName: String?, thoroughfare: Thoroughfare?, dependentLocality: LocalityDependentLocality?) {
        self.localityName = localityName
        self.thoroughfare = thoroughfare
        self.dependentLocality = dependentLocality
    }
}

// MARK: - LocalityDependentLocality
public struct LocalityDependentLocality: Codable {
    public let dependentLocalityName: String?
    public let dependentLocality: DependentLocalityDependentLocality?

    enum CodingKeys: String, CodingKey {
        case dependentLocalityName
        case dependentLocality
    }

    public init(dependentLocalityName: String?, dependentLocality: DependentLocalityDependentLocality?) {
        self.dependentLocalityName = dependentLocalityName
        self.dependentLocality = dependentLocality
    }
}

// MARK: - DependentLocalityDependentLocality
public struct DependentLocalityDependentLocality: Codable {
    public let dependentLocalityName: String?

    enum CodingKeys: String, CodingKey {
        case dependentLocalityName
    }

    public init(dependentLocalityName: String?) {
        self.dependentLocalityName = dependentLocalityName
    }
}

// MARK: - Thoroughfare
public struct Thoroughfare: Codable {
    public let thoroughfareName: String?
    public let premise: Premise?

    enum CodingKeys: String, CodingKey {
        case thoroughfareName
        case premise
    }

    public init(thoroughfareName: String?, premise: Premise?) {
        self.thoroughfareName = thoroughfareName
        self.premise = premise
    }
}

// MARK: - Premise
public struct Premise: Codable {
    public let premiseNumber: String?
    public let postalCode: PostalCode?

    enum CodingKeys: String, CodingKey {
        case premiseNumber
        case postalCode
    }

    public init(premiseNumber: String?, postalCode: PostalCode?) {
        self.premiseNumber = premiseNumber
        self.postalCode = postalCode
    }
}

// MARK: - PostalCode
public struct PostalCode: Codable {
    public let postalCodeNumber: String?

    enum CodingKeys: String, CodingKey {
        case postalCodeNumber
    }

    public init(postalCodeNumber: String?) {
        self.postalCodeNumber = postalCodeNumber
    }
}

// MARK: - Point
public struct Point: Codable {
    public let pos: String?

    public init(pos: String?) {
        self.pos = pos
    }
}

// MARK: - GeoObjectCollectionMetaDataProperty
public struct GeoObjectCollectionMetaDataProperty: Codable {
    public let geocoderResponseMetaData: GeocoderResponseMetaData?

    enum CodingKeys: String, CodingKey {
        case geocoderResponseMetaData
    }

    public init(geocoderResponseMetaData: GeocoderResponseMetaData?) {
        self.geocoderResponseMetaData = geocoderResponseMetaData
    }
}

// MARK: - GeocoderResponseMetaData
public struct GeocoderResponseMetaData: Codable {
    public let point: Point?
    public let request, results, found: String?

    enum CodingKeys: String, CodingKey {
        case point
        case request, results, found
    }

    public init(point: Point?, request: String?, results: String?, found: String?) {
        self.point = point
        self.request = request
        self.results = results
        self.found = found
    }
}
