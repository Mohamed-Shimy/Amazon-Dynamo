//
//  Product.swift
//  AmazonDynamo
//
//  Created by Mohamed Shemy on 10/12/2022.
//  Copyright © 2022 Mohamed Shimy. All rights reserved.
//

import Foundation

struct Product: Identifiable {
    
    let id: String
    let name: String
    let createdAt: String
    let price: String
    let imageIds: [String]
    let imageURLs: [String]
    let imageURLsThumbnails: [String]
}

// MARK: - Mapping Response

extension Product {
    
    init?(_ response: ProductResponse) {
        guard let id = response.uid else { return nil }
        self.init(id: id,
                  name: response.name ?? "",
                  createdAt: response.createdAt ?? "",
                  price: response.price ?? "",
                  imageIds: response.imageIds ?? [],
                  imageURLs: response.imageURLs ?? [],
                  imageURLsThumbnails: response.imageURLsThumbnails ?? [])
    }
}

// MARK: - Proview Data

extension Product {
    
    static let preview: Product = .init(id: "4878bf592579410fba52941d00b62f94",
                                        name: "Notebook",
                                        createdAt: "2019-02-24 04:04:17.566515",
                                        price: "AED 5",
                                        imageIds: ["9355183956e3445e89735d877b798689"],
                                        imageURLs: ["https://demo-app-photos-45687895456123.s3.amazonaws.com/9355183956e3445e89735d877b798689?AWSAccessKeyId=ASIASV3YI6A4SR6N3GVJ&Signature=S1dKA37h9DI9Mx4F%2BQCCRddE3TI%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJGMEQCIFJmZvJ1NKhblwdNcp9Z%2B9mpL19xzvfRGp%2FDSSThqN3rAiALiKy8MP7KTokihyehBMl0tKj%2By2nek6v3Nzwr%2F2%2FQviryAggaEAQaDDE4NDM5ODk2Njg0MSIMHasa4%2FTPazfCsc%2BrKs8C5L9TL5mfjx6CCfilPZQIVPI%2F9pyqA8YWn9ngbEBnusK0vyUgy0rP23YUEQIDETb5sj8nBXDLpoTCJV%2BKfBtqKCwvl5gl8ztOX5%2FhKZteTin%2F6VEJzdn7UBEmjM19Zil%2BytBlnehr9ennv59rfUgIUptwqGuCy4uPdbaDAlDLDdfb5wCxGRPw2i2prJpJEmWzQAcGu3ljgQe3PeEPQre39zSeYCgIIDMKZCBRh3eg6hgNIuGvdjQtTDNFeByQt2B10Tja8l8CDM8w0JdodlvTkrcHG77VKvYTgU6r1OSSCAMgYcGjss%2BMh8OcsakfcfstuEHdUkhOr0rdRRBBqxPiKpAlI540aZ8ElMCsMBgMznkXrcuLDfScR%2BKfLnjDAGtxCFv9DM%2BScx1%2BxkrKABlvaVsAYpJzZqMVnznFXw8hJS2C6mLPqnsFzOpREgr9azcwy%2FO9nAY6nwF4cxkuby5%2FYrfDRLMKzZChN2m8tWt%2BIlDmk6QvIHWPBNrSBkErZBCBN0CKVD7Jd1UuQEHKiDd2HhEo3RY8eiYUT%2BtuHQWu3AEWtEhl7g9fbPayYOvEAsGqszQA5o7%2BjLgkMGJOHo1pqfvVee3yrHf3W1A%2FbY1G%2B0vG8ZDiwZ3Fwr%2BW8ex51IT34%2FbK6d6gHMaebc0Bv9gWvPTSdEu3c9s%3D&Expires=1670351128"],
                                        imageURLsThumbnails: ["https://demo-app-photos-45687895456123.s3.amazonaws.com/9355183956e3445e89735d877b798689-thumbnail?AWSAccessKeyId=ASIASV3YI6A4SR6N3GVJ&Signature=0p3k0wk8njJkbCX%2FHn%2Fjp6LTd0Y%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJGMEQCIFJmZvJ1NKhblwdNcp9Z%2B9mpL19xzvfRGp%2FDSSThqN3rAiALiKy8MP7KTokihyehBMl0tKj%2By2nek6v3Nzwr%2F2%2FQviryAggaEAQaDDE4NDM5ODk2Njg0MSIMHasa4%2FTPazfCsc%2BrKs8C5L9TL5mfjx6CCfilPZQIVPI%2F9pyqA8YWn9ngbEBnusK0vyUgy0rP23YUEQIDETb5sj8nBXDLpoTCJV%2BKfBtqKCwvl5gl8ztOX5%2FhKZteTin%2F6VEJzdn7UBEmjM19Zil%2BytBlnehr9ennv59rfUgIUptwqGuCy4uPdbaDAlDLDdfb5wCxGRPw2i2prJpJEmWzQAcGu3ljgQe3PeEPQre39zSeYCgIIDMKZCBRh3eg6hgNIuGvdjQtTDNFeByQt2B10Tja8l8CDM8w0JdodlvTkrcHG77VKvYTgU6r1OSSCAMgYcGjss%2BMh8OcsakfcfstuEHdUkhOr0rdRRBBqxPiKpAlI540aZ8ElMCsMBgMznkXrcuLDfScR%2BKfLnjDAGtxCFv9DM%2BScx1%2BxkrKABlvaVsAYpJzZqMVnznFXw8hJS2C6mLPqnsFzOpREgr9azcwy%2FO9nAY6nwF4cxkuby5%2FYrfDRLMKzZChN2m8tWt%2BIlDmk6QvIHWPBNrSBkErZBCBN0CKVD7Jd1UuQEHKiDd2HhEo3RY8eiYUT%2BtuHQWu3AEWtEhl7g9fbPayYOvEAsGqszQA5o7%2BjLgkMGJOHo1pqfvVee3yrHf3W1A%2FbY1G%2B0vG8ZDiwZ3Fwr%2BW8ex51IT34%2FbK6d6gHMaebc0Bv9gWvPTSdEu3c9s%3D&Expires=1670351128"])
}
