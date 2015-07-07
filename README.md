# autoscale-ironworker
An IronWorker that scales up other workers based on IronMQ queue sizes. 

## How to use this

**NOTE:** You must have the Iron CLI tool setup and ready, see here for more info: 
https://github.com/iron-io/dockerworker

**NOTE:** You will need an iron.json file in this directory with your [Iron.io](http://iron.io) credentials. Copy 
`iron-example.json` to `iron.json` and fill in the blanks. There are two sections here, one for IronWorker/IronCache,
 and another for IronMQ v3 (since v3 has separate auth). 

1. Clone this repo
1. Copy `scale-example.json` to `scale.json`
1. Edit `scale.json` to define your auto-scaling rules. See below for explanation of file format. 
1. Run it locally to test and ensure that it starts up a worker for your queue. First add message(s) to your queue then run: 
    `docker run --rm -v "$(pwd)":/worker -w /worker iron/images:ruby-2.1 ruby autoscaler.rb`
1. Upload this worker to IronWorker: `zip -r autoscaler.zip . && iron worker upload --name autoscaler --zip autoscaler.zip iron/images:ruby-2.1 ruby autoscaler.rb`
1. Schedule it: `iron worker schedule --start-at 2015-06-24T08:00:00Z --run-every 1800 autoscaler`

## Auto Scaling Rules Definition

Example 1: This one will start 1 worker if there's a single message in the queue. 

```
{
  "queues": [
    {
      "name": "queueA",
      "triggers": [
        {
          "trigger": 1,
          "type": "fixed"
        },
        {
          "trigger": 50,
          "type": "progressive"
        }
      ],
      "worker": "worker"
    }
  ]
}
```

## TODO:

* [ ] Look at actual number of running workers?
* [ ] Max workers
