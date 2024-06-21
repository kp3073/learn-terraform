variable "fruit" {
  default = "apple"
}

variable "fruits" {
  default = ["apple","banana"]
}

variable "price_fruits" {
  default = {
    apple = 10
    banana = 20
  }
}

output "fruit" {
  value = var.fruit
}


output "fruits" {
  value = var.fruits
}


output "price_fruits" {
  value = var.price_fruits
}


output "first_fruit" {
  value = var.price_fruits["apple"]
}