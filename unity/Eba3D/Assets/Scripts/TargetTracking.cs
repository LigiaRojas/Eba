using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR;
using UnityEngine.XR.ARFoundation;

[RequireComponent(typeof(ARTrackedImageManager))]
public class TargetTracking : MonoBehaviour
{
    [SerializeField]
    private GameObject[] prefabs;

    private string prefabName;

    private readonly Dictionary<string, GameObject> prefabsMap = new Dictionary<string, GameObject>();
    private ARTrackedImageManager trackedImageManager;

    private void Awake()
    {
        trackedImageManager = FindObjectOfType<ARTrackedImageManager>();

        foreach (GameObject prefab in prefabs)
        {
            GameObject newPrefab = Instantiate(prefab, Vector3.zero, Quaternion.Euler(-90, 0, 0));
            newPrefab.name = prefab.name;
            newPrefab.SetActive(false);
            prefabsMap.Add(prefab.name, newPrefab);
        }
    }

    private void OnEnable()
    {
        trackedImageManager.trackedImagesChanged += TargetChanged;
    }

    private void OnDisable()
    {
        trackedImageManager.trackedImagesChanged -= TargetChanged;
    }

    private void TargetChanged(ARTrackedImagesChangedEventArgs args)
    {
        foreach (ARTrackedImage trackedImage in args.added)
        {
            UpdateScene(trackedImage);
        }
        foreach (ARTrackedImage trackedImage in args.updated)
        {
            UpdateScene(trackedImage);
        }
        foreach (ARTrackedImage trackedImage in args.removed)
        {
            prefabsMap[prefabName].SetActive(false);
        }
    }

    private void UpdateScene(ARTrackedImage trackedImage)
    {
        Vector3 position = trackedImage.transform.position;
        GameObject prefab = prefabsMap[prefabName];
        prefab.transform.position = position;
        prefab.SetActive(true);

        foreach (GameObject gameObject in prefabsMap.Values)
        {
            if (gameObject.name != prefabName)
            {
                gameObject.SetActive(false);
            }
        }
    }

    public void SetPrefabName(string prefabName)
    {
        this.prefabName = prefabName;
    }
}
