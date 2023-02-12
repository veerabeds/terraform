data "archive_file" "python_zip" {
  type             = "zip"
  source_file      = "${path.module}/python/file.py"
  output_file_mode = "0666"
  output_path      = "${path.module}/python/file.zip"
}