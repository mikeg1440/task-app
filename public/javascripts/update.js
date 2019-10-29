
window.onload = function ()
{
  tasks = document.getElementsByClassName('task');
  function update_tasks()
  {
    // alert("Working!");
  }

  checks = [];
  for (i = 0; i < tasks.length; i++)
  {
    checks.push(tasks[i].children[0].children[0]);
  }

  for (task_id = 0; task_id < tasks.length; task_id++) {
    checks[task_id].addEventListener("click", update_tasks);

  }


}
