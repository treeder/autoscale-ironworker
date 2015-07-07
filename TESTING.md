

### Queue up some tasks:

```
docker run --rm -v "$(pwd)":/worker -w /worker iron/images:ruby-2.1 ruby queue_tasks.rb
```

This will run for a while, kill it if just testing locally. 

### Test queue_worker.rb:

```
docker run --rm -v "$(pwd)":/worker -w /worker iron/images:ruby-2.1 ruby queue_worker.rb
```

### Upload queue_worker.rb:

```
zip -r queue_worker.zip . && iron worker upload --name queue_worker --zip queue_worker.zip iron/images:ruby-2.1 ruby queue_worker.rb
```

### And queue up some more tasks

Same queue_tasks.rb command above. 

### Run autoscaler.rb:

```
docker run --rm -v "$(pwd)":/worker -w /worker iron/images:ruby-2.1 ruby autoscaler.rb
```

This will keep checking queue sizes and launch workers to process them. 
