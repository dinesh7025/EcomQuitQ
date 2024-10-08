import { Injectable } from '@angular/core';
import { BlobServiceClient } from '@azure/storage-blob';

@Injectable({
  providedIn: 'root',
})
export class UploadImageService {
  private containerName = 'productimages';
  private blobServiceClient: BlobServiceClient;

  constructor() {
    // Use the SAS URL with the SAS token
    const sasUrl = 'https://quitqimages.blob.core.windows.net/?sv=2022-11-02&ss=bfqt&srt=co&sp=rwdlacupiytfx&se=2024-10-20T13:20:46Z&st=2024-10-08T05:20:46Z&spr=https&sig=ipLZrYJBplc3XE%2FQ0YOroeU80xti9ORRCXBDrqmR15k%3D';

    // Initialize the BlobServiceClient using the SAS URL
    this.blobServiceClient = new BlobServiceClient(sasUrl);
  }

  async uploadFileToBlob(file: File): Promise<string> {
    const containerClient = this.blobServiceClient.getContainerClient(this.containerName);
    const blobClient = containerClient.getBlockBlobClient(file.name);

    // Upload the file to Azure Blob Storage
    const uploadBlobResponse = await blobClient.uploadBrowserData(file);
    console.log(`Upload block blob ${file.name} successfully`, uploadBlobResponse);

    console.log('Blob URL:', blobClient.url);
    return blobClient.url;
  }
}
