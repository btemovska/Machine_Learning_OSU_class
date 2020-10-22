import csv

with open(""C:/Users/btemo/IdeaProjects/OSU Machine Learning/Fashion_MNINST_2/fashion-mnist_train.csv"", newline='') as f: #data was too large to import this will work
    reader = csv.reader(f)
    row_count = 0
    for row in reader:
        if row_count==0:
            row_count = row_count + 1
            continue
        example_pixel_list = row
        print(row)
        break
    length_of_example_pixel_list = len(example_pixel_list)
    print(length_of_example_pixel_list) #785
f.close()


#the data on the link is represented as a csv file in which each row is an image
#the images are black and white 28x28 pixels images of clothes
#each image row is 785 cells long
#the first cell in each row represents label (which type of clothes it is)
#the remaining 784 cells (28x28) represent pixels
#each with value between 0 and 255
