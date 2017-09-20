require "sinatra"
require "sinatra/reloader" if development?
require "pp" if development?

java_import org.apache.pdfbox.pdmodel.PDDocument

# Java
require 'java' # use java libs :)
require File.join __dir__, "lib/java/", "pdfbox-app-2.0.7.jar"

get "/" do

  file = java.io.File.new File.join(__dir__, "form.pdf")
  doc = PDDocument.load(file);

  tempfile = Tempfile.new
  doc.save java.io.File.new(tempfile.path)

  content_type "application/pdf"
  tempfile.read

end
