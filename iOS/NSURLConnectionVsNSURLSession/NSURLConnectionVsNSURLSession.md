# Difference between NSURLConnection and NSURLSession

### NSURLConnection

1. Authentication is handled less elegantly on request basis

2. For each request which we are sending out, we need to get ourselves authenticated

3. NSURLConnection drains more battery and tasks can't be resumed, suspended and cancelled

4. Doesn't support any configarations

### NSURLSession

1. Authentication is handled more elegantly on connection basis

2. For the entire stream of requests, only for the first request I need to get myself authenticated. For subsequent requests, we need not get authenticated again

3. NSURLSession preserves battery life and tasks can be resumed, suspended and cancelled at any point of time

4. Supports 3 kinds of configarations: Default (In Disk), Emphimeral (In memory), Background (Download task)