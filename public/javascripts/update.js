function update_tasks(task)
{
  var xhr = new XMLHttpRequest();
  xhr.open("PATCH", '/tasks', true);
  xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
  params = `task_id= ${task.value}`
  xhr.send(params);

}

function delete_task(link)
{
  var xhr = new XMLHttpRequest();
  xhr.open("DELETE", '/tasks', true);
  xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
  params = `task_id= ${task.value}`
  xhr.send(params);
}

// window.onload = function ()
// {
//   tasks = document.getElementsByClassName('task');
//   function update_tasks()
//   {
//     btn = document.getElementById("update_task_btn");
//
//     alert(btn.click());
//   }
//
//
//   checks = [];
//   for (i = 0; i < tasks.length; i++)
//   {
//     checks.push(tasks[i].children[0].children[0]);
//   }
//
//   for (task_id = 0; task_id < tasks.length; task_id++) {
//     // checks[task_id].addEventListener("click", update_tasks);
//       // checks[task_id].addEventListener("click", update_tasks);
//
//   }
//
//
// }
