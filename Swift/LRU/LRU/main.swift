//
//  main.swift
//  LRU
//
//  Created by Meng on 2021/1/20.
//

let cache = LRUCache<String>(2)
cache.set("a", val: 1)
cache.set("b", val: 2)
cache.set("c", val: 3)
print(cache.get("a") ?? "a 对应的值为 nil") // returns 1
cache.set("c", val: 3) // evicts key "b"
print(cache.get("b") ?? "b 对应的值为 nil") // returns nil (not found)
cache.set("d", val: 4) // evicts key "a"
print(cache.get("a") ?? "a 对应的值为 nil") // returns nil (not found)
print(cache.get("c") ?? "c 对应的值为 nil") // returns 3
print(cache.get("d") ?? "d 对应的值为 nil") // returns 4

print(cache)
