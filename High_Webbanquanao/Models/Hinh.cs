namespace High_Webbanquanao.Models
{
    public static class Hinh
    {
        public static string UploadImageToFolder(IFormFile myfile, string folder)

        {
            try
            {
                var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "HinhAnh", folder, myfile.FileName);
                using (var newFile = new FileStream(filePath, FileMode.Create))
                {
                    myfile.CopyTo(newFile);
                }
                return myfile.FileName;
            }
            catch (Exception ex)
            {
                return string.Empty;
            }

        }
    }
}
