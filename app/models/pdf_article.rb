class PdfArticle < Prawn::Document
  attr_accessor :article

  def initialize(article)
    self.article = article
  end # #initialize




  def to_pdf
    self.render
  end # #to_pdf

end
