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
  var link_uri = link.attributes["href"];
  var task_id = link_uri.textContent.match(/\d+/i)[0];
  // alert(task_id)
  xhr.open("DELETE", `/tasks/${task_id}`, true);
  xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
  params = `task_id=${task_id}`
  xhr.send(params);
  location.reload();
}

function ConfirmDelete()
{
  if(confirm('Press OK to confirm deletion of this account')) {
    document.getElementById("delete_account").submit();
  } else {
    return false;
  }
}
