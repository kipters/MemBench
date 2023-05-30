var numTasks = args switch
{
    [string x] when int.TryParse(x, out var intArg) => intArg,
    _ => 100_000
};

var tasks = new List<Task>();
for (int i = 0; i < numTasks; i++)
{
    tasks.Add(Task.Delay(TimeSpan.FromSeconds(10)));
}

await Task.WhenAll(tasks);
