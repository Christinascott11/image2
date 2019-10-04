class Image
  def initialize (image)
    @image = image
  end

  def blur (num)
    num.times do
      output
   end
  end

  def find_ones
    # find all ones in arrays and track whereabouts
    # need the function to return where ones can be found 
    # to keep track make a variable that is an empty array and can fill up once found
    ones = []
    @image.each_with_index do |row, row_number|
      row.each_with_index do |item, col_number|
        if item == 1
          ones << [row_number, col_number]
        end
      end
    end

  ones
  end
    
  def output
    ones = find_ones
      @image.each_with_index do |row, row_number|
        # calls the row and its number
        row.each_with_index do |item, col_number|
          # calls the item (1) and the col number
          ones.each do |new_row_number, new_col_number|
            # calls each (1) in the new row and each 1 in the new column
            
            if row_number == new_row_number && col_number == new_col_number 
          
              #if the row number is equal to the new row number then the out will be true
              @image[row_number +1][col_number] =1  unless row_number >=@image.length - 1 # bottom
              @image[row_number -1][col_number] =1  unless row_number ==0 # top
              @image[row_number][col_number +1] =1  unless col_number >=row.length - 1  # outer right
              @image[row_number][col_number -1] =1  unless col_number ==0  # outer left
            end
          end
        end
      end
    end
        
  def output_image
    @image.each do |info|
      puts info.join
    end
  end
end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0]
])
#Image.new makes a new image object from the image class
#inside .new() is what the class is created with 
image.blur(4)
image.output_image 

