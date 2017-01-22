class Image
  attr_accessor :image

  def initialize (array)
    @image = array
  end
  
  def output_image
    @image.each do |row|
      puts row.join
    end
  end

  def blur! (blur=1)
    blur.times do
      blur_place!
    end
  end

  def blur_place!
    blur_place = []
    @image.each_with_index do |row, index|
      row.each_with_index do |x, row_index|
        blur_place << [index, row_index] if x == 1
      end
    end

      blur_place.each do |place|
        @image[place[0]][place[1] + 1] = 1 if place[1] + 1 <= @image[place[0]].length - 1
        @image[place[0]][place[1] - 1] = 1 if place[1] - 1 >= 0
        @image[place[0] + 1][place[1]] = 1 if place[0] + 1 <= @image.length - 1
        @image[place[0] - 1][place[1]] = 1 if place[0] - 1 >= 0
      end
    end

end
   
image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])


