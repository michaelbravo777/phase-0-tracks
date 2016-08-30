#Michael Bravo
#5.6 Solving Problems with Data Structures
#Paired with Gregory Bilello

#Implement a simple search
def integer_search(array, integer)
	index = 0
	while index < array.length
		if array[index] == integer
			return index
		end
	index += 1
	end
end

integers = [7, 12, 19, 42, 38, 9, 172, 44, 79, 90, 101, 66]
p integer_search(integers, 101)

#Calculate Fibonacci Numbers
def fib(terms)
	fibonacci = [0, 1]
	index = 2
	if terms == 1
		fibonacci = [0]
	else
		while index < terms
			fibonacci[index] = fibonacci[index - 1] + fibonacci[index - 2]
			index += 1
		end
	end
	p fibonacci
end

fib(100)

#Sort an array with a bubble sort
def bubble_sort(array)
	index = 0
	swapped = true
	#counting the number of times the algorithm goes through the array
	count = 0

	while swapped == true
		swapped = false
		while index < (array.length - 1)
			if array[index] > array[index + 1]
				#swapping the array indicies
				array[index], array[index + 1] = array[index + 1], array[index]
				swapped = true
			end
			index += 1
		end
		count += 1
		index = 0
	end
	p count
	p array
end

#using the same array of integers as above
p integers
bubble_sort(integers)
