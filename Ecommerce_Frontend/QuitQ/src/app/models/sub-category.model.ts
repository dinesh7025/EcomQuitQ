export interface SubCategory {
  subCategoryId: number;
  parentCategoryId: number;
  subCategoryName: string;
  parentcategoryName?:string;
  description: string;
}